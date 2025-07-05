package com.library.repository;

import java.util.ArrayList;
import java.util.List;

public class BookRepository {

    private final List<String> books = new ArrayList<>();

    public BookRepository() {
        books.add("The Pragmatic Programmer");
        books.add("Clean Code");
        books.add("Design Patterns: Elements of Reusable OO Software");
    }

    public List<String> findAll() {
        return books;
    }

    public void save(String title) {
        books.add(title);
    }
}
