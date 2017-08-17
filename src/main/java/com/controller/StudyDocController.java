package com.controller;

import com.baomidou.mybatisplus.plugins.Page;
import com.entity.StudyDoc;
import com.service.StudyDocService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.List;

/**
 * Created by Administrator on 2017/4/28.
 */
@Controller
@RequestMapping("/studyDoc")
public class StudyDocController {

	@Autowired
	private StudyDocService studyDocService;

	@ResponseBody
	@RequestMapping("/getStudyDocs")
	public List<StudyDoc> getStudyDocs(Integer index) {
		List<StudyDoc> studyDocs = studyDocService.selectPage(new Page<StudyDoc>(index, 3)).getRecords();
		return studyDocs;
	}

	@ResponseBody
	@RequestMapping("/getStudyDocsPage")
	public Integer getStudyDocsPage() {
		int i = studyDocService.selectCount(null);
		int count = (i % 3) == 0 ? (i / 3) : (i / 3) + 1;
		if(count == 0) count = 1;
		return count;
	}

	@ResponseBody
	@RequestMapping("/getStudyDocById")
	public StudyDoc getStudyDocById(Integer id) {

		StudyDoc studyDoc = studyDocService.selectById(id);
		return studyDoc;
	}

	@RequestMapping("/download")
	public void download(Integer id, HttpServletRequest request, HttpServletResponse response) {
		StudyDoc studyDoc = studyDocService.selectById(id);
		try {
			//下载
			String filename = studyDoc.getTitle() +".txt";
			//转码，避免文件名中文乱码
			filename = URLEncoder.encode(filename, "utf-8");
			//设置文件下载头
			response.addHeader("Content-Disposition", "attachment;filename=" + filename);
			//1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
			response.setCharacterEncoding("utf-8");
			response.setContentType("multipart/form-data");
			OutputStream os = response.getOutputStream();
			os.write(studyDoc.getContent().getBytes("utf-8"));
			os.flush();
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
