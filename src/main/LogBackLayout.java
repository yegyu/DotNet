package main;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.CoreConstants;
import ch.qos.logback.core.LayoutBase;

public class LogBackLayout extends LayoutBase<ILoggingEvent>{
	
	public String doLayout(ILoggingEvent e) {
		StringBuffer sbuf = new StringBuffer(128);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH.mm.ss");
//		sbuf.append(new Timestamp(e.getLoggerContextVO().getBirthTime()).toString().substring(0, 19));
		sbuf.append(sdf.format(e.getTimeStamp()));
		sbuf.append(",");
		sbuf.append(e.getLevel());
		sbuf.append(",");
		sbuf.append(e.getLoggerName());
		sbuf.append(",");
		sbuf.append(e.getMessage());
		sbuf.append(CoreConstants.LINE_SEPARATOR);
		return sbuf.toString();
	}
}
