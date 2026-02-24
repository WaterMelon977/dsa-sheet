package com.sumanth.sheet;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class SheetApplication {

	public static void main(String[] args) {
		SpringApplication.run(SheetApplication.class, args);
	}

}
