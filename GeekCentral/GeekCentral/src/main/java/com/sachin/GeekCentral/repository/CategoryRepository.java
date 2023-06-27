package com.sachin.GeekCentral.repository;

import com.sachin.GeekCentral.entity.Category;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category, Integer> {

}
