package com.example.ElectronicGrade.model.service;

import com.example.ElectronicGrade.model.entity.Course;
import com.example.ElectronicGrade.model.entity.Grade;
import com.example.ElectronicGrade.model.entity.Lesson;
import com.example.ElectronicGrade.model.entity.Subject;
import com.example.ElectronicGrade.model.entity.users.Student;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TeacherServiceTest {

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private StudentService studentService;

    @Test
    public void findSubjectsByTeacherId() {
        Map subjects = teacherService.findSubjectsByTeacherId(13L);
        subjects.get(0);

        List<Lesson> lessons = teacherService.findLessonsBySubjectAndClassId(5L, 2L);

        Student student = studentService.findById(1L).get();
        Grade grade = student.getGrades().get(0);

    }

}