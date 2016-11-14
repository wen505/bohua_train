package com.bh.train.service.impl;

import com.bh.train.common.Constant;
import com.bh.train.model.BhDictionaryHeader;
import com.bh.train.model.BhDictionaryLine;
import com.bh.train.service.CacheService;
import com.bh.train.service.DictionaryService;
import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;
import org.springframework.cache.Cache;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zhuyy on 2016/11/12.
 */
@Service("cacheService")
public class CacheServiceImpl implements CacheService {

    private static final Logger LOGGER = Logger.getLogger(CacheServiceImpl.class);
    @Resource
    private DictionaryService dictionaryService;
    @Resource
    private EhCacheCacheManager cacheManager;
    @Override
    public void initDictionary() {
        LOGGER.info("初始化缓存......");
        List<BhDictionaryLine> bhDictionaryLineList = dictionaryService.findAllDictionaryDetail();
        List<BhDictionaryHeader> bhDictionaryHeaderList = dictionaryService.findAllDictionaryHeader();
        if (CollectionUtils.isNotEmpty(bhDictionaryHeaderList)) {
            for (BhDictionaryHeader bhDictionaryHeader : bhDictionaryHeaderList) {
                List<BhDictionaryLine> dictionaryLines = new ArrayList<BhDictionaryLine>();
                for (BhDictionaryLine bhDictionaryLine : bhDictionaryLineList) {
                    if (bhDictionaryLine.getHeaderCode().equals(bhDictionaryHeader.getHeaderCode())) {
                        dictionaryLines.add(bhDictionaryLine);
                    }
                }
                pushCache(bhDictionaryHeader.getHeaderCode(),dictionaryLines);
            }
        }
    }

    /**
     * 向缓存中添加元素
     * @param o1 key
     * @param o2 value
     */
    public void pushCache(Object o1, Object o2) {
        LOGGER.info("pushCache, key值:" + o1.toString());
        Cache cache = cacheManager.getCache(Constant.CACHE_NAME);
        cache.put(o1, o2);
    }

    /**
     * 从缓存中取元素
     * @param o1 key
     * @return
     */
    public Object getCache(Object o1) {
        LOGGER.info("getCache, key值:" + o1.toString());
        Cache cache = cacheManager.getCache(Constant.CACHE_NAME);
        return cache.get(o1.toString()).get();
    }
}
