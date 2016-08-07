package com.wenban.bbs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.wenban.bbs.model.KindEDResult;
import com.wenban.bbs.service.UploadService;

@Controller
public class UploadController {
	@Autowired
	private UploadService uploadservice;

	@RequestMapping(value = "/uploadimage" ,method = RequestMethod.POST)
	@ResponseBody
	public KindEDResult uploadimage(MultipartFile imgFile) {
		try {
			return new KindEDResult(0, uploadservice.uploadFile(imgFile));
		} catch (Exception e) {
			e.printStackTrace();
			return new KindEDResult(1, "上传失败");
		}

	}
}
