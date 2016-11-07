package com.bh.train.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

/**
 * 文件操作服务类接口
 * @author gs
 *
 */
public interface IFileOperateService {
	/**
	 * 
	 * 上传文件
	 * @param file 文件
	 * @param remotepath 存放文件夹
	 * @param filename 上传文件名
	 * @return
	 */
	@Deprecated
	public Map<String, Object>  uploadFTPFile(MultipartFile file, String remotepath, String filename);
	
	/**
	 * 
	 * 上传图片到ftp(压缩)
	 * @param file 文件
	 * @param remotepath 存放文件夹
	 * @param filename 上传文件名
	 * @return
	 */
	@Deprecated
	public Map<String, Object>  uploadImageFile(MultipartFile file, String remotepath, String filename, String width, String height);

	/**
	 * kindediter 图片ftp预览
	 * @param dirName
	 * @param path
	 * @param order 排序方式
	 * @return
	 */
	@Deprecated
	public Map<String, Object> previewuploadImg(String dirName, String path, String order);
	/**
	 * 上传文件到项目文件夹
	 * @param file 文件
	 * @param remotepath 存放的文件夹
	 * @return
	 */
	public Map<String, Object> uploadFile(MultipartFile file, String remotepath);
	/**
     * 上传图片到项目文件夹（并压缩）
	 * @param filename 指定的文件名
	 * @param path
	 * @param remotepath 存放的文件夹
	 * @param width
	 * @param height
	 * @return
	 */
	public Map<String, Object> uploadImage(MultipartFile file, String filename, String remotepath, String width, String height);
	
	
	/**
	 * kindediter 图片预览
	 * @param dirName
	 * @param path
	 * @param order 排序方式
	 * @return
	 */
	public Map<String, Object> previewImg(String dirName, String path, String order);
}
