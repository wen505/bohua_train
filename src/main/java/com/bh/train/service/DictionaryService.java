package com.bh.train.service;

import com.bh.train.common.util.PageController;
import com.bh.train.model.BhDictionaryHeader;
import com.bh.train.model.BhUser;

/**
 * Created by zhuyy on 2016/10/25.
 */
public interface DictionaryService {

    public PageController<BhDictionaryHeader> find(BhDictionaryHeader bhDictionaryHeader, String page, String rows);


}
