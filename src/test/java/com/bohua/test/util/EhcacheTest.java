package com.bohua.test.util;

import com.bh.train.model.BhDictionaryHeader;
import com.bh.train.service.CacheService;
import com.bh.train.service.DictionaryService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.apache.log4j.Logger;
import org.springframework.cache.Cache;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by zhuyy on 2016/11/11.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext.xml",
        "classpath:mybatis/spring-mybatis.xml"})
public class EhcacheTest {

    private static final Logger logger = Logger.getLogger(EhcacheTest.class);

    @Resource
    private DictionaryService dictionaryService;

    @Resource
    private EhCacheCacheManager cacheManager;

    @Resource
    private CacheService cacheService;
    @Test
    public void getAllDictionaryHeader() {
        List<BhDictionaryHeader> bhDictionaryHeaders =  dictionaryService.findAllDictionaryHeader();
        Cache cache = cacheManager.getCache("bohua");
        System.out.println(cache.getName());
        List<BhDictionaryHeader> bhDictionaryHeaderList = (List<BhDictionaryHeader>) cache.get("findAllDictionaryHeader").get();
    }

    @Test
    public void cacheServiceTest() {
        List<BhDictionaryHeader> bhDictionaryHeaderList = (List<BhDictionaryHeader>) cacheService.getCache("COURSE");
        System.out.println(bhDictionaryHeaderList.size());
    }
}
