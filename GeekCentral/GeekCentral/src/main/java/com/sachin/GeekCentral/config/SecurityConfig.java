package com.sachin.GeekCentral.config;

import com.sachin.GeekCentral.security.CustomUserDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;

@Configuration
@EnableMethodSecurity
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private CustomUserDetailService customUserDetailService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests().antMatchers("/signup", "/").permitAll() // Allow access to signup and index pages without authentication
                .anyRequest().authenticated() // Require authentication for all other requests
                .and()
                .formLogin()//.loginPage("/login") // Specify the custom login page URL
                //.loginProcessingUrl("/login")
                .defaultSuccessUrl("/main")
                .permitAll() // Allow access to the login page without authentication
                // .and()
                // .exceptionHandling()
                // .accessDeniedPage("/access_denied")
                //.authenticationEntryPoint(new LoginUrlAuthenticationEntryPoint("/login"))
                .and()
                .logout().logoutSuccessUrl("/") // Redirect to the login page after successful logout
                .invalidateHttpSession(true)
                .clearAuthentication(true)
                .permitAll(); // Allow access to the logout URL without authentication
    }


    @Override
    public void configure(WebSecurity web) throws Exception {
        // Allow access to static resources
        web.ignoring().antMatchers("/css/**", "/js/**", "/images/**");
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(this.customUserDetailService).passwordEncoder(passwordEncoder());
    }

//    @Bean
//    public AuthenticationProvider authenticationProvider() {
//        // Return your custom authentication provider or any other desired authentication provider
//        return (AuthenticationProvider) new CustomUserDetailService();
//    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

//    @Bean
//    public AuthenticationProvider authProvider() {
//        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
//        provider.setUserDetailsService(customUserDetailService);
//        provider.setPasswordEncoder(passwordEncoder());
//        return provider;
//    }

}