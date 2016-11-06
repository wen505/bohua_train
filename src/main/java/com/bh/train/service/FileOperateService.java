package com.bh.train.service;

import java.util.Map;

import com.bh.train.common.vo.RspFileListVo;
import com.bh.train.common.vo.RspUploadVo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件操作服务类接口
 * @author gs
 *
 */
public interface FileOperateService {

	/**
	 * 上传文件到项目文件夹
	 * @param file 文件
	 * @param remotepath 存放的文件夹
	 * @return
	 */
	public RspUploadVo uploadFile(String realPath, MultipartFile file, String remotepath,String filename);
	/**
     * 上传图片到项目文件夹（并压缩）
	 * @param filename 指定的文件名
	 * @param remotepath 存放的文件夹
	 * @param width
	 * @param height
	 * @return
	 */
	public RspUploadVo uploadImage(String realPath, MultipartFile file, String filename, String remotepath, String width, String height);
	
	
	/**
	 * kindediter 图片预览
	 * @param dirName
	 * @param path
	 * @param order 排序方式
	 * @return
	 */
	public RspFileListVo previewImg(String realPath, String dirName, String path, String order);

	/**
	 * 删除文件
	 * @param realPath
	 * @param filename
	 * @param remotepath
     * @return
     */
	public boolean deleteFile(String realPath,  String filename, String remotepath);
}
