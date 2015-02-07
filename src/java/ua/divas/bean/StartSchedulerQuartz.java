package ua.divas.bean;

import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.bean.ManagedBean;
import javax.servlet.GenericServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.impl.StdSchedulerFactory;


public class StartSchedulerQuartz extends GenericServlet {
    
    public static Scheduler sched;
    
    public void init(ServletConfig config) throws ServletException {
 
        super.init(config);
        
        Properties prop = new Properties();

        prop.setProperty("org.quartz.scheduler.instanceName", "REMAINDER_SCHEDULER");
        prop.setProperty("org.quartz.threadPool.class", "org.quartz.simpl.SimpleThreadPool");
        prop.setProperty("org.quartz.threadPool.threadCount", "10");

        prop.setProperty("org.quartz.threadPool.threadsInheritContextClassLoaderOfInitializingThread", "true");

        prop.setProperty("org.quartz.jobStore.class", "org.quartz.impl.jdbcjobstore.JobStoreTX");
        prop.setProperty("org.quartz.jobStore.driverDelegateClass", "org.quartz.impl.jdbcjobstore.oracle.OracleDelegate");
        prop.setProperty("org.quartz.jobStore.dataSource", "divas");
        prop.setProperty("org.quartz.jobStore.tablePrefix", "QRTZ_");

        prop.setProperty("org.quartz.dataSource.divas.driver", "oracle.jdbc.driver.OracleDriver");
        prop.setProperty("org.quartz.dataSource.divas.URL", "jdbc:oracle:thin:@192.168.1.102:1521:db12c");
        prop.setProperty("org.quartz.dataSource.divas.user", "dba_divas");
        prop.setProperty("org.quartz.dataSource.divas.password", "divas");
        prop.setProperty("org.quartz.dataSource.divas.maxConnections", "1");
        
        try {             
            SchedulerFactory sf = new StdSchedulerFactory(prop);            
            sched = sf.getScheduler();
            sched.start();
            System.out.println("Шедулер стартовал");
            
        } catch (SchedulerException e) {
            System.out.println("Ошибка " + e);
        }
    }
    public void destroy(){
       
        try {
            sched.shutdown();
            System.out.println("Шедулер остановлен");
        } catch (SchedulerException ex) {
            Logger.getLogger(StartSchedulerQuartz.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
 
    @Override
    public void service(
            ServletRequest arg0, 
            ServletResponse arg1
    ) throws ServletException, IOException {
 
    }
}
