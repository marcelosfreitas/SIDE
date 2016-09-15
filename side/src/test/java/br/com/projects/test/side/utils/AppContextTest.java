package br.com.projects.test.side.utils;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import br.com.projects.side.utils.AppContext;

@Configuration
@Import(value = {AppContext.class})
@ComponentScan(basePackages = {"br.com.projects.test.side"} )

public class AppContextTest {

}
