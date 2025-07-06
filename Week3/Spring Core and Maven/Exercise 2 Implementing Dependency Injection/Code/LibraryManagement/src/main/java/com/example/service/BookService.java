package com.example.service;

import com.example.repository.BookRepository;

public class BookService {
    private final BookRepository bookRepository;

    // Constructor for dependency injection
    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public void addBook(String name) {
        System.out.println("Adding book: " + name);
        bookRepository.saveBook(name);
    }
}
