package com.bohua.test.service;

import com.bh.train.model.BhDictionaryLine;
import com.bh.train.service.CacheService;
import com.bh.train.service.DictionaryService;
import com.bohua.test.common.BaseCase;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by zhuyy on 2016/11/23.
 */
public class DictionaryServiceCase extends BaseCase<DictionaryServiceCase> {

    @Resource
    private DictionaryService dictionaryService;

    @Resource
    private CacheService cacheService;

    @Test
    public void TestMethod1() {
        List<BhDictionaryLine> bhDictionaryLines = dictionaryService.queryDetailByHeaderCode("COURSE");
        logger.error(bhDictionaryLines.size());
        BhDictionaryLine bhDictionaryLine = new BhDictionaryLine();
        bhDictionaryLine.setHeaderCode("COURSE");
        bhDictionaryLine.setLineCode("1823");
        bhDictionaryLine.setSn(23);
        bhDictionaryLine.setLineName("物理");
        bhDictionaryLine.setIsDefault("N");
        bhDictionaryLine.setMemo("sdasdasda");
        int re = dictionaryService.saveOrUpdate(bhDictionaryLine);
        logger.error(re);
        List<BhDictionaryLine> bhDictionaryLineListCache = (List<BhDictionaryLine>) cacheService.getCache("COURSE");
        cacheService.clearCache();
        List<BhDictionaryLine> bhDictionaryLineList = dictionaryService.queryDetailByHeaderCode("COURSE");
        logger.error(bhDictionaryLineList.size());
    }
}
