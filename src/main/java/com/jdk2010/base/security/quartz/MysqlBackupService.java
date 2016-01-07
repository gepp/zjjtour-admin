package com.jdk2010.base.security.quartz;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jdk2010.framework.util.ConfigUtil;
import com.jdk2010.framework.util.DateUtil;
import com.jdk2010.framework.util.FileUtil;

public class MysqlBackupService {

    static Logger logger = LoggerFactory.getLogger(MysqlBackupService.class);

    /**
     * 备份数据库
     * @throws IOException 
     */
    public void execute() throws IOException {
        Date now = new Date();
        DateFormat df = DateFormat.getDateTimeInstance();
        String dbName = df.format(now) + ".sql";
        dbName = dbName.replaceAll(":", "_");
        dbName = dbName.replaceAll(" ", "_");
        ConfigUtil util = new ConfigUtil("/conf/db.properties");
        String user = util.getString("db.username");
        String password = util.getString("db.password");
        String database = util.getString("mysql.database");
        String filepath = util.getString("mysql.backupPath") + dbName;
        FileUtil.mkdir(util.getString("mysql.backupPath"));
        String nowTime=DateUtil.getNowTime("yyyy-MM-dd");
        
        List<File> fileList=FileUtil.getPathAllFileExt(util.getString("mysql.backupPath"),".sql");
        Iterator<File> iterator=fileList.iterator();
        while (iterator.hasNext()){
            File file=iterator.next();
            String fileName=file.getName();
            String fileDate=fileName.substring(0,10);
            if(DateUtil.betweenDay(nowTime,fileDate,"yyyy-MM-dd")>7){
               file.delete();
            }
        }
        // 创建执行的批处理
        FileOutputStream fout = null;
        OutputStreamWriter writer = null;
        try {
            String batFile = util.getString("mysql.backupPath")+"\\backup_database.bat";
            fout = new FileOutputStream(batFile);
            writer = new OutputStreamWriter(fout, "utf8");
            StringBuffer sb = new StringBuffer("");
            sb.append(util.getString("mysql.root") + " \r\n");
            sb.append("cd " + util.getString("mysql.binPath") + " \r\n");
            sb.append("mysqldump -u " + user + " -p" + password + " " + database + " >" + filepath + "\r\n");
            sb.append("exit");
            String outStr = sb.toString();
            writer.write(outStr);
            writer.flush();
            writer.close();
            fout.close();

            Runtime.getRuntime().exec(" cmd /c start " + batFile);
            logger.info("备份数据库成功！");
        } catch (IOException e) {
            e.printStackTrace();
            logger.error("备份数据库失败！", e);
        } finally {
            writer = null;
            fout = null;
        }

    }
}
