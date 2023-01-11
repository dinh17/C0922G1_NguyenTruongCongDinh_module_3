package repository;

import model.ClassType;

import java.util.List;

public interface IClassRepository {
    List<ClassType> findAllClass();

}
