package service;

import model.StudentType;
import repository.impl.StudentTypeRepository;

import java.util.List;

public interface IStudentTypeService {
    List<StudentType> findAllStudentType();
}
