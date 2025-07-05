package com.library.service;

import com.library.repository.BookRepository;
import java.util.List;

public class BookService {

    private final BookRepository repository;

    public BookService(BookRepository repository) {
        this.repository = repository;
    }

    public List<String> getAllBooks() {
        return repository.findAll();
    }

    public void addBook(String title) {
        repository.save(title);
    }
}
