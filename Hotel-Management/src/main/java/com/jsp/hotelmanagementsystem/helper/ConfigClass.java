package com.jsp.hotelmanagementsystem.helper;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ConfigClass 
{
	@Bean
	public EntityManagerFactory getEMF()
	{
		return Persistence.createEntityManagerFactory("dev");	
	}
	@Bean
	public EntityManager getEM()
	{
		return getEMF().createEntityManager();
	}
	@Bean
	public EntityTransaction getET()
	{
		return getEM().getTransaction();
	}
}
