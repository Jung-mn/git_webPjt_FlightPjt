package com.office.flight.config;

import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.beans.factory.support.BeanNameGenerator;

public class FlightBeanNameGenerator implements 
	BeanNameGenerator
{
	@Override
	public String generateBeanName(
			BeanDefinition definition, 
			BeanDefinitionRegistry registry) {
		
		System.out.println(definition.getBeanClassName());
		//return null;
		return  definition.getBeanClassName() ;
	}
	
	
}