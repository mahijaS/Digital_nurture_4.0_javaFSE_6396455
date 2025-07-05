package com.library;

import com.library.service.BookService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
    public static void main(String[] args) {

        ApplicationContext ctx =
                new ClassPathXmlApplicationContext("applicationContext.xml");
        BookService bookService = ctx.getBean(BookService.class);

        System.out.println("Current books:");
        bookService.getAllBooks().forEach(System.out::println);

        bookService.addBook("Head First Design Patterns");
        System.out.println("\nAfter adding a book:");
        bookService.getAllBooks().forEach(System.out::println);
    }
}
