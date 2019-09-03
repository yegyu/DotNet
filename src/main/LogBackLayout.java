package main;

import java.sql.Timestamp;

import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.CoreConstants;
import ch.qos.logback.core.LayoutBase;

public class LogBackLayout extends LayoutBase<ILoggingEvent>{

	public String doLayout(ILoggingEvent e) {
		StringBuffer sbuf = new StringBuffer(128);
		sbuf.append(new Timestamp(e.getLoggerContextVO().getBirthTime()).toString().substring(0, 19));
		sbuf.append(",");
		sbuf.append(e.getLevel());
		sbuf.append(",");
//		sbuf.append(e.getThreadName());
//		sbuf.append(" ,");
		sbuf.append(e.getLoggerName());
		sbuf.append(",");
		sbuf.append(e.getMessage());
		sbuf.append(CoreConstants.LINE_SEPARATOR);
		return sbuf.toString();
	}
}
