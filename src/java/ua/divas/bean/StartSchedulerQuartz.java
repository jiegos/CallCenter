package ua.divas.bean;

import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.GenericServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.impl.StdSchedulerFactory;
import ua.divas.model.QuartzPropertyFacade;
import ua.divas.model.entity.QuartzProperty;

public class StartSchedulerQuartz extends GenericServlet {

    public static Scheduler sched;

    @EJB
    private QuartzPropertyFacade qpf;
    private QuartzProperty p;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        if (qpf.findAll().size() > 0) {
            for (QuartzProperty qp : qpf.findAll()) {
                p = qp;
                System.out.println("Настроки Quartz загружены!");
            }
            Properties prop = new Properties();

            prop.setProperty("org.quartz.scheduler.instanceName", p.getInstanceName());
            prop.setProperty("org.quartz.threadPool.class", p.getThreadpoolClass());
            prop.setProperty("org.quartz.threadPool.threadCount", p.getThreadCount());

            prop.setProperty("org.quartz.threadPool.threadsInheritContextClassLoaderOfInitializingThread", p.getThreadsContext());

            prop.setProperty("org.quartz.jobStore.class", p.getJobstoreClass());
            prop.setProperty("org.quartz.jobStore.driverDelegateClass", p.getDriverDelegate());
            prop.setProperty("org.quartz.jobStore.dataSource", p.getDataSource());
            prop.setProperty("org.quartz.jobStore.tablePrefix", p.getTablePrefix());

            prop.setProperty("org.quartz.dataSource.divas.driver", p.getDriver());
            prop.setProperty("org.quartz.dataSource.divas.URL", p.getUrl());
            prop.setProperty("org.quartz.dataSource.divas.user", p.getUsr());
            prop.setProperty("org.quartz.dataSource.divas.password", p.getPassword());
            prop.setProperty("org.quartz.dataSource.divas.maxConnections", p.getMaxConnections());

            try {
                SchedulerFactory sf = new StdSchedulerFactory(prop);
                sched = sf.getScheduler();
                sched.start();
                System.out.println("Шедулер стартовал");

            } catch (SchedulerException e) {
                System.out.println("Ошибка " + e);
            }

        } else {
            System.out.println("В базе данных нет настроек Quartz!");
        }

    }

    public void destroy() {

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
