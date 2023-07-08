//package com.fpoly.security;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
//import org.springframework.security.config.http.SessionCreationPolicy;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.provisioning.InMemoryUserDetailsManager;
//import org.springframework.security.web.SecurityFilterChain;
//import org.springframework.security.web.firewall.HttpFirewall;
//import org.springframework.security.web.firewall.StrictHttpFirewall;
//
//@Configuration
//@EnableWebSecurity
//public class WebSecurityConfig {
//  @Bean
//  public UserDetailsService userDetailsService() {
//    InMemoryUserDetailsManager manager = new InMemoryUserDetailsManager();
//    manager.createUser(User.withDefaultPasswordEncoder().username("user").password("1").roles("USER").build());
//    return manager;
//  }
//
//  @Bean
//  public HttpFirewall httpFirewall() {
//    StrictHttpFirewall firewall = new StrictHttpFirewall();
//    firewall.setAllowUrlEncodedDoubleSlash(true);
//    return firewall;
//  }
//
//  @Bean
//  public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//    http.
////            csrf(AbstractHttpConfigurer::disable)
////            .sessionManagement((sessionManagement) ->
////                    sessionManagement.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
////            )
//            authorizeHttpRequests(auth -> auth
////                    .requestMatchers("/").permitAll()
//                    .anyRequest().permitAll());
////    http.formLogin(form -> {
////      form.loginPage("/customer/login").permitAll();
////    });
//    return http.build();
//  }
//
//}
