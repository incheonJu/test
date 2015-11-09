package com.eip.template.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.flywaydb.core.Flyway;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.util.Properties;


/**
 * Created by 이주환 on 2015-09-16.
 */
@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(value = "com.eip.template.repository")
@PropertySource(value = "classpath:/properties/hibernate.properties")
public class DataConfig {
    @Autowired
    private Environment environment;

    @Bean(initMethod = "migrate")
    Flyway flyway() {
        Flyway flyway = new Flyway();
        flyway.setBaselineOnMigrate(true);
        flyway.setLocations("db/migration");
        flyway.setDataSource(dataSource());
        return flyway;
    }

    @Bean @DependsOn("flyway")
    public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
        LocalContainerEntityManagerFactoryBean localContainerEntityManagerFactoryBean = new LocalContainerEntityManagerFactoryBean();
        localContainerEntityManagerFactoryBean.setDataSource(dataSource());
        localContainerEntityManagerFactoryBean.setPackagesToScan("com.eip.template.domain");
        localContainerEntityManagerFactoryBean.setJpaVendorAdapter(jpaVendorAdapter());
        localContainerEntityManagerFactoryBean.setJpaProperties(jpaProperties());
        //localContainerEntityManagerFactoryBean.setPersistenceUnitName("ddd");

        return localContainerEntityManagerFactoryBean;
    }

    /*Hibernate
    @Bean
    public LocalSessionFactoryBean sessionFactory() {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        sessionFactory.setDataSource(dataSource());
        sessionFactory.setPackagesToScan(new String[]{"com.eip.template.repository"});
        sessionFactory.setHibernateProperties(hibernateProperties());
        return sessionFactory;
    }*/

    /*Hibernate
    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(environment.getProperty("jdbc.driverClassName"));
        dataSource.setUrl(environment.getProperty("jdbc.url"));
        dataSource.setUsername(environment.getProperty("jdbc.username"));
        dataSource.setPassword(environment.getProperty("jdbc.password"));
        return dataSource;
    }*/

    @Bean(destroyMethod = "close")
    public DataSource dataSource() {
        final HikariConfig config = new HikariConfig();
        config.setDriverClassName(environment.getProperty("jdbc.driverClassName"));
        config.setJdbcUrl(environment.getProperty("jdbc.url"));
        config.setUsername(environment.getProperty("jdbc.username"));
        config.setPassword(environment.getProperty("jdbc.password"));

        config.setPoolName("hibernatePool");
        config.setMaximumPoolSize(400);
        config.setMinimumIdle(5);
        config.setLeakDetectionThreshold(15000);
        config.setConnectionTestQuery("SELECT 1");
        config.setConnectionTimeout(1000);

        return new HikariDataSource(config);
    }

    private Properties jpaProperties() {
        final Properties jpaProperties = new Properties() {
            {
                setProperty("hibernate.dialect", environment.getProperty("hibernate.dialect"));
                setProperty("hibernate.show_sql", environment.getProperty("hibernate.show_sql"));
                setProperty("hibernate.format_sql", environment.getProperty("hibernate.format_sql"));
                setProperty("hibernate.hbm2ddl.auto", environment.getProperty("hibernate.hbm2ddl.auto"));
            }
        };

        return jpaProperties;
    }

    /*Hibernate
    private Properties hibernateProperties() {
        Properties properties = new Properties();
        properties.put("hibernate.dialect", environment.getProperty("hibernate.dialect"));
        properties.put("hibernate.show_sql", environment.getProperty("hibernate.show_sql"));
        properties.put("hibernate.format_sql", environment.getProperty("hibernate.format_sql"));
        return properties;
    }*/


    private JpaVendorAdapter jpaVendorAdapter() {
       /* final JpaVendorAdapter jpaVendorAdapter = new HibernateJpaVendorAdapter() {
            {
                setShowSql(true);
                setDatabase(Database.MYSQL);
                setGenerateDdl(false);
            }
        };*/

        JpaVendorAdapter jpaVendorAdapter = new HibernateJpaVendorAdapter();
        return jpaVendorAdapter;
    }

    /*Hibernate    @Bean
    @Autowired
    public HibernateTransactionManager transactionManager(SessionFactory s) {
        HibernateTransactionManager txManager = new HibernateTransactionManager();
        txManager.setSessionFactory(s);
        return txManager;
    }*/

    @Bean
    public PlatformTransactionManager transactionManager() {
        return new JpaTransactionManager(entityManagerFactory().getObject());
    }

    @Bean
    public PersistenceExceptionTranslationPostProcessor exceptionTranslator() {
        return new PersistenceExceptionTranslationPostProcessor();
    }

}
