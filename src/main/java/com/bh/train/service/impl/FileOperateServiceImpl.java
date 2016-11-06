package com.bh.train.service.impl;

import com.bh.train.common.Constant;
import com.bh.train.common.service.BaseService;
import com.bh.train.common.util.ImageCompressUtil;
import com.bh.train.common.util.ServiceUtil;
import com.bh.train.common.vo.RspFileListVo;
import com.bh.train.common.vo.RspPreviewImgVo;
import com.bh.train.common.vo.RspUploadVo;
import com.bh.train.service.FileOperateService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by lp on 2016/11/4.
 */
@Service("fileOperateService")
public class FileOperateServiceImpl extends BaseService implements FileOperateService {

    private Logger logger =  Logger.getLogger(FileOperateServiceImpl.class);
    @Override
    public RspUploadVo uploadFile(String realPath,MultipartFile file, String remotepath,String filename) {
        boolean flag = false;
        String separator= System.getProperty("file.separator");
        String  imageName ="";
        if(!StringUtils.isEmpty(filename)){
//            String[] image =  filename.split("\\.");
//            String[] fimage =  file.getOriginalFilename().split("\\.");
            imageName = filename;
        }else{
            String[] image =  file.getOriginalFilename().split("\\.");
            imageName = ServiceUtil.getidByUUID() +"."+ image[image.length-1];
        }

        //图片扩展名
        try {
            String path= realPath+separator+ Constant.UPLOAD_PATH;
            File parentfile = new File(path);
            if(!parentfile.exists()){
                parentfile.mkdirs();
            }
            File remotepathfile  = new File(path+separator+remotepath);
            if(!remotepathfile.exists()){
                remotepathfile.mkdirs();
            }
            file.transferTo(new  File(path+separator+remotepath+separator+imageName));
            flag = true;
        } catch (IllegalStateException e) {
            flag = false;
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        } catch (IOException e) {
            flag = false;
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        RspUploadVo rspUploadVo = new RspUploadVo();
        if(flag){
            rspUploadVo.setError(0);
            rspUploadVo.setHeadicon(imageName);
            rspUploadVo.setUrl("/"+Constant.UPLOAD_PATH+"/"+remotepath+"/"+imageName);

        }else{
            rspUploadVo.setError(1);
            rspUploadVo.setMessage("上传文件失败！");
        }
        return rspUploadVo;
    }

    @Override
    public RspUploadVo uploadImage(String realPath,MultipartFile file, String filename, String remotepath, String width, String height) {
        boolean flag = false;
        String separator= System.getProperty("file.separator");
        String imageName="";
        if(StringUtils.isEmpty(filename)){
            String[] image =  file.getOriginalFilename().split("\\.");
            imageName =ServiceUtil.getidByUUID() +"."+ image[image.length-1];
        }else{
            imageName = filename;
        }
        try {
            String path= realPath+separator+Constant.UPLOAD_PATH;
            File parentfile = new File(path);
            if(!parentfile.exists()){
                parentfile.mkdirs();
            }
            File remotepathfile  = new File(path+separator+remotepath);
            if(!remotepathfile.exists()){
                remotepathfile.mkdirs();
            }
            String  url  = path+separator+remotepath+separator+imageName;
            if(!StringUtils.isEmpty(width)){
                int w= Integer.parseInt(StringUtils.isEmpty(width)?"1000":width);
                ImageCompressUtil.saveMinPhoto(file.getInputStream(), url, w,  0.9d);
            }else{
                int h= Integer.parseInt(StringUtils.isEmpty(height)?"200":height);
                ImageCompressUtil.saveMinPhoto(file.getInputStream(), url, h,  1d);
            }
            flag = true;
        } catch (IllegalStateException e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
            flag = false;
        } catch (IOException e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
            flag = false;
        } catch (Exception e) {
            flag = false;
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        RspUploadVo rspUploadVo = new RspUploadVo();
        if(flag){
            rspUploadVo.setError(0);
            rspUploadVo.setHeadicon(imageName);
            rspUploadVo.setUrl("/"+Constant.UPLOAD_PATH+"/"+remotepath+"/"+imageName);

        }else{
            rspUploadVo.setError(1);
            rspUploadVo.setMessage("上传文件失败！");
        }
        return rspUploadVo;
    }

    @Override
    public RspFileListVo previewImg(String realPath, String dirName, String path, String order) {
        //图片扩展名
        String[] fileTypes = new String[]{"gif", "jpg", "jpeg", "png", "bmp"};
        //图片扩展名
        String separator= System.getProperty("file.separator");
        String filepath= realPath+separator+Constant.UPLOAD_PATH+separator+path;
        File dirfile = new File(filepath);
        Map<String, Object> result = new HashMap<String, Object>();
        //遍历目录取的文件信息
        List<RspPreviewImgVo> fileList = new ArrayList<RspPreviewImgVo>();
        File[] listFiles = dirfile.listFiles();
        if(null!=listFiles){
            for (File file : listFiles) {
                RspPreviewImgVo rspPreviewImgVo = new RspPreviewImgVo();
                String fileName = file.getName();
                if(file.isDirectory()) {
                    rspPreviewImgVo.setIs_dir(true);
                    rspPreviewImgVo.setHas_file(false);
                    rspPreviewImgVo.setFilesize(0L);
                    rspPreviewImgVo.setIs_photo(false);
                    rspPreviewImgVo.setFiletype("");
                } else if(file.isFile()){
                    String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
                    rspPreviewImgVo.setIs_dir(false);
                    rspPreviewImgVo.setHas_file(false);
                    rspPreviewImgVo.setFilesize(file.length());
                    rspPreviewImgVo.setIs_photo(Arrays.<String>asList(fileTypes).contains(fileExt));
                    rspPreviewImgVo.setFiletype(fileExt);
                }
                rspPreviewImgVo.setFilename(fileName);
                rspPreviewImgVo.setDatetime( new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(file.lastModified()));
                fileList.add(rspPreviewImgVo);
            }
        }
        if ("size".equals(order)) {
            Collections.sort(fileList, new SizeComparator());
        } else if ("type".equals(order)) {
            Collections.sort(fileList, new TypeComparator());
        } else {
            Collections.sort(fileList, new NameComparator());
        }
        RspFileListVo rspFileListVo = new RspFileListVo();
        rspFileListVo.setCurrent_dir_path(path);
        rspFileListVo.setCurrent_url( "/"+Constant.UPLOAD_PATH+"/"+path+"/");
        rspFileListVo.setFile_list(fileList);
        rspFileListVo.setMoveup_dir_path(path);
        rspFileListVo.setTotal_count(fileList.size());

        return rspFileListVo;
    }


    /**
     * 删除文件
     * @param realPath
     * @param filename
     * @param remotepath
     * @return
     */
    @Override
    public boolean deleteFile(String realPath, String filename, String remotepath){
        String separator= System.getProperty("file.separator");
        String path= realPath+separator+ Constant.UPLOAD_PATH;
        String url = path+separator+remotepath+separator+filename;
        File newxFile =new File(url);
        if (newxFile.exists()){
            newxFile.delete();
        }
        return true;
    }
}
/**
 * 按名称排序
 * @author gs
 *
 */
@SuppressWarnings("rawtypes")
class NameComparator implements Comparator {
    public int compare(Object a, Object b) {
        RspPreviewImgVo hashA = (RspPreviewImgVo)a;
        RspPreviewImgVo hashB = (RspPreviewImgVo)b;
        if ((hashA.is_dir()) && !(hashB.is_dir())) {
            return -1;
        } else if (!(hashA.is_dir()) && (hashB.is_dir())) {
            return 1;
        } else {
            return (hashA.getFilename()).compareTo(hashB.getFilename());
        }
    }

}
/**
 * 按大小排序
 * @author gs
 *
 */
@SuppressWarnings("rawtypes")
class SizeComparator implements Comparator {
    public int compare(Object a, Object b) {
        RspPreviewImgVo hashA = (RspPreviewImgVo)a;
        RspPreviewImgVo hashB = (RspPreviewImgVo)b;
        if ((hashA.is_dir()) && !(hashB.is_dir())) {
            return -1;
        } else if (!(hashA.is_dir()) && (hashB.is_dir())) {
            return 1;
        } else {
            if ((hashA.getFilesize()) > (hashB.getFilesize())) {
                return 1;
            } else if ((hashA.getFilesize()) < (hashB.getFilesize())) {
                return -1;
            } else {
                return 0;
            }
        }
    }
}
/**
 * 按类型排序
 * @author gs
 *
 */
@SuppressWarnings("rawtypes")
class TypeComparator implements Comparator {
    public int compare(Object a, Object b) {
        RspPreviewImgVo hashA = (RspPreviewImgVo)a;
        RspPreviewImgVo hashB = (RspPreviewImgVo)b;
        if ((hashA.is_dir()) && !(hashB.is_dir())) {
            return -1;
        } else if (!(hashA.is_dir()) && (hashB.is_dir())) {
            return 1;
        } else {
            return (hashA.getFiletype()).compareTo(hashB.getFiletype());
        }
    }


}
