package com.panfeng.web.wearable.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.channels.FileChannel;
import java.util.Properties;

import com.panfeng.web.wearable.resource.model.IndentProject;
import com.panfeng.web.wearable.resource.model.IndentResource;

public class FileUtils {

	/**
	 * 获取文件后缀名
	 * 
	 * @param fileName
	 *            文件名
	 * @param split
	 *            分隔符
	 * @return 文件后缀名
	 */
	public static String getExtName(final String fileName, final String split) {

		if (fileName.lastIndexOf(".") != -1 && fileName.lastIndexOf(".") != 0) {
			return fileName.substring(fileName.lastIndexOf(".") + 1);
		} else {
			return "";
		}
	}

	/**
	 * 获取文件上传地址
	 * 
	 * @param demand
	 * @param is
	 * @return
	 */
	public static String getServerUploadPath(final String demand,
			final InputStream is) {
		try {
			Properties propertis = new Properties();
			propertis.load(is);
			is.close();
			final String path = propertis.getProperty(demand);
			return path;
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}

	public static void deleteFile(final String path) {
		if (path != null && !"".equals(path)) {
			File file = new File(path);
			if (file.exists() && !file.isDirectory()) {
				file.delete();
			}
		}
	}

	/**
	 * 根据后缀名分辨 视频/图片 文件
	 * 
	 * @param extName
	 *            文件后缀名
	 * @param imageType
	 *            图片类型
	 * @param videoType
	 *            视频类型
	 * @return 0 视频文件 / 1 图片文件 / 2 其他文件
	 */
	public static short divideIntoGroup(final String extName,
			final String imageType, final String videoType) {
		final String[] iTypeArray = imageType.split("/");
		final String[] vTypeArray = videoType.split("/");
		for (final String type : iTypeArray) {
			if (type.equalsIgnoreCase(extName)) {
				return 1;
			}
		}
		for (final String type : vTypeArray) {
			if (type.equalsIgnoreCase(extName)) {
				return 0;
			}
		}
		return 2;
	}

	/**
	 * 文件拷贝
	 */
	public static void copyFile(final File originalFile, final File newFileName) {

		FileInputStream fi = null;
		FileOutputStream fo = null;

		FileChannel in = null;
		FileChannel out = null;

		try {
			fi = new FileInputStream(originalFile);
			fo = new FileOutputStream(newFileName);

			in = fi.getChannel(); // 获取对应通道
			out = fo.getChannel(); // 获取对应通道
			in.transferTo(0, in.size(), out); // 连接两个通道，并且从in通道读取，然后写入out通道

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			try {
				fi.close();
				in.close();
				fo.close();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	/**
	 * 保存文件流到硬盘
	 * 
	 * @param is
	 * @param path
	 * @return
	 */
	public static boolean saveFileByInputStream(final InputStream is,
			final String path) {
		boolean state = false;
		byte[] dataBuf = new byte[2048];
		BufferedInputStream bis = new BufferedInputStream(is, 8192);
		BufferedOutputStream bos = null;
		try {
			bos = new BufferedOutputStream(new FileOutputStream(path), 8192);
			int count = 0;
			while ((count = bis.read(dataBuf)) != -1) {
				bos.write(dataBuf, 0, count);
			}
			bos.flush();

			state = true;
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (bos != null)
					bos.close();
				bis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return state;
	}

	public static boolean saveFileByFile(final File file, final String path)
			throws FileNotFoundException {
		return saveFileByInputStream(new FileInputStream(file), path);
	}

	/**
	 * 删除文件夹
	 * 
	 * @param filePath
	 * @param deleteThisPath
	 */
	public static void deleteFolderFile(String filePath, boolean deleteThisPath) {
		try {
			File file = new File(filePath);
			if (file.isDirectory()) {// 处理目录
				File files[] = file.listFiles();
				for (int i = 0; i < files.length; i++) {
					deleteFolderFile(files[i].getAbsolutePath(), true);
				}
			}
			if (deleteThisPath) {
				if (!file.isDirectory()) {// 如果是文件，删除
					file.delete();
				} else {// 目录
					if (file.listFiles().length == 0) {// 目录下没有文件或者目录，删除
						file.delete();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 生成redis 储存文件的key
	 * 
	 * @param indentProject
	 * @return
	 */
	public static String getRedisKey(IndentProject indentProject) {
		return "r_" + indentProject.getId();
	}

	public static String getRedisKey(IndentResource indentResource) {
		return "r_" + indentResource.getIrIndentId();
	}
}
