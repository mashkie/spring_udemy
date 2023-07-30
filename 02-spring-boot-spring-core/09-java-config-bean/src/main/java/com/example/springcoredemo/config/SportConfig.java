package com.example.springcoredemo.config;

import com.example.springcoredemo.common.Coach;
import com.example.springcoredemo.common.SwimCoach;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Bean;

@Configuration
public class SportConfig {

    @Bean("aquatic")
    public Coach swimCoach() {
        return new SwimCoach();
    }
}
