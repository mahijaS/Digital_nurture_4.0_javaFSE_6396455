package com.library.repository;

import java.util.ArrayList;
import java.util.List;

public class BookRepository {

    private final List<String> books = new ArrayList<>();

    public BookRepository() {
        books.add("Refactoring: Improving the Design of Existing Code");
        books.add("Working Effectively with Legacy Code");
    }

    public List<String> findAll() {
        return books;
    }

    public void save(String title) {
        books.add(title);
    }
}
