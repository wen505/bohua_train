package com.bh.train.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.baidu.ueditor.ActionEnter;
import com.bh.train.common.Constant;
import com.bh.train.common.controller.BaseController;
import com.bh.train.common.exception.BusinessException;
import com.bh.train.common.vo.RspData;
import com.bh.train.common.vo.RspFileListVo;
import com.bh.train.common.vo.RspUediterVo;
import com.bh.train.common.vo.RspUploadVo;
import com.bh.train.service.FileOperateService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件操作控制类
 * 
 * @author gs
 * 
 */
@Controller
@RequestMapping(value = "/back/fileOperate")
public class FileOperateController extends BaseController<FileOperateController> {
	@Resource
	private FileOperateService fileOperateService;


		@RequestMapping("/dispatch.do")
		public void config(String action) {
			getResponse().setContentType("application/json");
			String rootPath = getRequest().getSession().getServletContext().getRealPath("/");

			try {
				String exec = new ActionEnter(getRequest(), rootPath).exec();
				PrintWriter writer = getResponse().getWriter();
				writer.write(exec);
				writer.flush();
				writer.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}

	/**
	 * 上传文件
	 * 
	 * @param file
	 * @return
	 */
	@RequestMapping(value = "/uploadFile.do")
	@ResponseBody
	public RspUediterVo uploadFile(MultipartFile file,
			String remotePeath, String filNeame) {
		RspUediterVo dataMap;
		try {
			String contentType = file.getContentType();
			dataMap = fileOperateService.uploadFile(getRealPath(),file, remotePeath,filNeame);
		} catch (BusinessException e) {
			logger.error(e.getMessage(), e);
//			dataMap = new RspUploadVo();
//			dataMap.setError(1);
//			dataMap.setMessage("上传文件失败！");
			return RspUediterVo.error();
		}
		return dataMap;
	}
	/**
	 * 上传文件
	 *
	 * @param file
	 * @return
	 */
	@RequestMapping(value = "/uploadFileStr.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String uploadFileStr(MultipartFile file,
										  String remotePath, String fileName) {
		RspUediterVo dataMap;
		String realPath = getSession().getServletContext().getRealPath("");
		try {
			String contentType = file.getContentType();
			dataMap = fileOperateService.uploadFile(getRealPath(),file, remotePath,fileName);
		} catch (BusinessException e) {
			logger.error(e.getMessage(), e);
//			dataMap = new RspUploadVo();
//			dataMap.setError(1);
//			dataMap.setMessage("上传文件失败！");
			dataMap=RspUediterVo.error();
		}
		return JSON.toJSONString(dataMap);
	}
	/**
	 * 上传图片(压缩)
	 * 
	 * @param file
	 * @return
	 */
	@RequestMapping("/uploadImage.do")
	@ResponseBody
	public RspUediterVo uploadImage(MultipartFile file,
			String remotePath, String fileName) {
		RspUediterVo dataMap;
		String width= super.getRequest().getParameter("width");
		String height= super.getRequest().getParameter("height");
		try {
			dataMap = fileOperateService.uploadImage(getRealPath(),file, fileName, remotePath, width, height);
		} catch (BusinessException e) {
			logger.error(e.getMessage(), e);
//			dataMap = new RspUploadVo();
//			dataMap.setError(1);
//			dataMap.setMessage("上传文件失败！");
			return RspUediterVo.error();
		}
		return dataMap;
	}
	/**
	 * 上传图片(压缩)
	 *
	 * @param file
	 * @return
	 */
	@RequestMapping(value = "/uploadImageStr.do",produces = "text/html; charset=utf-8")
	@ResponseBody
	public String uploadImageStr(MultipartFile file,
								   String remotePath, String fileName) {
		RspUediterVo dataMap;
		String width= super.getRequest().getParameter("width");
		String height= super.getRequest().getParameter("height");
		try {
			dataMap = fileOperateService.uploadImage(getRealPath(),file, fileName, remotePath, width, height);
		} catch (BusinessException e) {
			logger.error(e.getMessage(), e);
//			dataMap = new RspUploadVo();
//			dataMap.setError(1);
//			dataMap.setMessage("上传文件失败！");
			return JSON.toJSONString(RspUediterVo.error());
		}
		return JSON.toJSONString(dataMap);
	}
	/**
	 * kindediter插件浏览图片图片
	 *
	 * @return
	 */
	@RequestMapping("/previewuploadImg.do")
	@ResponseBody
	public RspFileListVo previewuploadImg() {
		String dirName = super.getRequest().getParameter("dir");
		// 根据path参数，设置各路径和URL
		String path = super.getRequest().getParameter("path") != null ? super
				.getRequest().getParameter("path") : "";
		// 排序形式，name or size or type
		String order = super.getRequest().getParameter("order") != null ? super
				.getRequest().getParameter("order").toLowerCase() : "name";
		RspFileListVo previewuploadImg = fileOperateService
				.previewImg(getRealPath(),dirName, path, order);
		return previewuploadImg;
	}

	/**
	 * 删除文件
	 * @param fileName
	 * @param fileType
     * @return
     */
	@RequestMapping("/deleteFile.do")
	@ResponseBody
	public RspData deleteFile(String fileName, String fileType) {

		try {
			fileOperateService.deleteFile(getRealPath(), fileName,  fileType);
		} catch (BusinessException e) {
			logger.error(e.getMessage(), e);
			return RspData.error(Constant.ERROR_CODE, e.getMessage());
		}
		return RspData.success(null);
	}
	

}
