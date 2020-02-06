class Student {
    constructor(firstname, lastname) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.courses = [];
    }
};

Student.prototype.name = function() {
    return `${this.firstname} ${this.lastname}`;
};

Student.prototype.enroll = function(course) {
    if (!course.students.includes(this)) {
        course.addStudent(this);
        this.courses.push(course);
    } 
};

Student.prototype.courseLoad = function() {
    courseHash = {};
    for(let course of this.courses) {
        courseHash[course.name] = course.credits
    }
    return courseHash;
}


class Course {
    constructor(name, dept, credits) {
        this.name = name;
        this.dept = dept;
        this.credits = credits;
        this.students = [];
    }
}


Course.prototype.addStudent = function(student) {
    this.students.push(student);
}