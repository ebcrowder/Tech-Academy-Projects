using System;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using CrowderUniversity.Models;

namespace CrowderUniversity.Data
{
    public static class DbInitializer
    {
        public static void Initialize(SchoolContext context)
        {
            //context.Database.EnsureCreated();

            // Look for any students.
            if (context.Students.Any())
            {
                return;   // DB has been seeded
            }

            var students = new Student[]
            {
                new Student { FirstMidName = "Justin",   LastName = "Gioeli",
                    EnrollmentDate = DateTime.Parse("2017-09-01") },
                new Student { FirstMidName = "Robb", LastName = "Wagonwheel",
                    EnrollmentDate = DateTime.Parse("2016-09-01") },
                new Student { FirstMidName = "Geoff",   LastName = "Jefferson",
                    EnrollmentDate = DateTime.Parse("2015-12-15") },
                new Student { FirstMidName = "Ryan",    LastName = "Adams",
                    EnrollmentDate = DateTime.Parse("2017-09-01") },
                new Student { FirstMidName = "James",      LastName = "Yim",
                    EnrollmentDate = DateTime.Parse("2015-09-01") },
                new Student { FirstMidName = "Mark",    LastName = "Clifford",
                    EnrollmentDate = DateTime.Parse("2016-09-01") },
                new Student { FirstMidName = "Lauren",    LastName = "Filiment",
                    EnrollmentDate = DateTime.Parse("2013-09-01") },
                new Student { FirstMidName = "Ben",     LastName = "Mulna",
                    EnrollmentDate = DateTime.Parse("2016-09-01") }
            };

            foreach (Student s in students)
            {
                context.Students.Add(s);
            }
            context.SaveChanges();

            var instructors = new Instructor[]
            {
                new Instructor { FirstMidName = "Tom",     LastName = "Scharpling",
                    HireDate = DateTime.Parse("1997-10-15") },
                new Instructor { FirstMidName = "Jon",    LastName = "Wurster",
                    HireDate = DateTime.Parse("1994-01-01") },
                new Instructor { FirstMidName = "Ben",   LastName = "Gibbard",
                    HireDate = DateTime.Parse("1997-09-01") },
                new Instructor { FirstMidName = "Justin", LastName = "Vernon",
                    HireDate = DateTime.Parse("2004-09-01") },
                new Instructor { FirstMidName = "Gerard",   LastName = "Fence",
                    HireDate = DateTime.Parse("2005-09-01") }
            };

            foreach (Instructor i in instructors)
            {
                context.Instructors.Add(i);
            }
            context.SaveChanges();

            var departments = new Department[]
            {
                new Department { Name = "English",     Budget = 500000,
                    StartDate = DateTime.Parse("2017-09-01"),
                    InstructorID  = instructors.Single( i => i.LastName == "Scharpling").ID },
                new Department { Name = "Mathematics", Budget = 750000,
                    StartDate = DateTime.Parse("2017-09-01"),
                    InstructorID  = instructors.Single( i => i.LastName == "Gibbard").ID },
                new Department { Name = "Engineering", Budget = 500000,
                    StartDate = DateTime.Parse("2017-09-01"),
                    InstructorID  = instructors.Single( i => i.LastName == "Wurster").ID },
                new Department { Name = "Business",   Budget = 750000,
                    StartDate = DateTime.Parse("2017-09-01"),
                    InstructorID  = instructors.Single( i => i.LastName == "Vernon").ID }
            };

            foreach (Department d in departments)
            {
                context.Departments.Add(d);
            }
            context.SaveChanges();

            var courses = new Course[]
            {
                new Course {CourseID = 1001, Title = "Chemistry",      Credits = 3,
                    DepartmentID = departments.Single( s => s.Name == "Engineering").DepartmentID
                },
                new Course {CourseID = 2001, Title = "Accounting", Credits = 3,
                    DepartmentID = departments.Single( s => s.Name == "Business").DepartmentID
                },
                new Course {CourseID = 2002, Title = "International Economics", Credits = 3,
                    DepartmentID = departments.Single( s => s.Name == "Business").DepartmentID
                },
                new Course {CourseID = 3001, Title = "Calculus",       Credits = 3,
                    DepartmentID = departments.Single( s => s.Name == "Mathematics").DepartmentID
                },
                new Course {CourseID = 3002, Title = "Trigonometry",   Credits = 3,
                    DepartmentID = departments.Single( s => s.Name == "Mathematics").DepartmentID
                },
                new Course {CourseID = 4001, Title = "Composition",    Credits = 3,
                    DepartmentID = departments.Single( s => s.Name == "English").DepartmentID
                },
                new Course {CourseID = 4002, Title = "Literature",     Credits = 3,
                    DepartmentID = departments.Single( s => s.Name == "English").DepartmentID
                },
            };

            foreach (Course c in courses)
            {
                context.Courses.Add(c);
            }
            context.SaveChanges();

            var officeAssignments = new OfficeAssignment[]
            {
                new OfficeAssignment {
                    InstructorID = instructors.Single( i => i.LastName == "Gibbard").ID,
                    Location = "Granger 101" },
                new OfficeAssignment {
                    InstructorID = instructors.Single( i => i.LastName == "Vernon").ID,
                    Location = "Bonnie 401" },
                new OfficeAssignment {
                    InstructorID = instructors.Single( i => i.LastName == "Wurster").ID,
                    Location = "Stubbs 202" },
            };

            foreach (OfficeAssignment o in officeAssignments)
            {
                context.OfficeAssignments.Add(o);
            }
            context.SaveChanges();

            var courseInstructors = new CourseAssignment[]
            {
                new CourseAssignment {
                    CourseID = courses.Single(c => c.Title == "Chemistry" ).CourseID,
                    InstructorID = instructors.Single(i => i.LastName == "Wurster").ID
                    },
                new CourseAssignment {
                    CourseID = courses.Single(c => c.Title == "Accounting" ).CourseID,
                    InstructorID = instructors.Single(i => i.LastName == "Vernon").ID
                    },
                new CourseAssignment {
                    CourseID = courses.Single(c => c.Title == "International Economics" ).CourseID,
                    InstructorID = instructors.Single(i => i.LastName == "Vernon").ID
                    },
                new CourseAssignment {
                    CourseID = courses.Single(c => c.Title == "Calculus" ).CourseID,
                    InstructorID = instructors.Single(i => i.LastName == "Gibbard").ID
                    },
                new CourseAssignment {
                    CourseID = courses.Single(c => c.Title == "Trigonometry" ).CourseID,
                    InstructorID = instructors.Single(i => i.LastName == "Gibbard").ID
                    },
                new CourseAssignment {
                    CourseID = courses.Single(c => c.Title == "Composition" ).CourseID,
                    InstructorID = instructors.Single(i => i.LastName == "Scharpling").ID
                    },
                new CourseAssignment {
                    CourseID = courses.Single(c => c.Title == "Literature" ).CourseID,
                    InstructorID = instructors.Single(i => i.LastName == "Scharpling").ID
                    },
            };

            foreach (CourseAssignment ci in courseInstructors)
            {
                context.CourseAssignments.Add(ci);
            }
            context.SaveChanges();

            var enrollments = new Enrollment[]
            {
                new Enrollment {
                    StudentID = students.Single(s => s.LastName == "Gioeli").ID,
                    CourseID = courses.Single(c => c.Title == "Chemistry" ).CourseID,
                    Grade = Grade.B
                },
                    new Enrollment {
                    StudentID = students.Single(s => s.LastName == "Wagonwheel").ID,
                    CourseID = courses.Single(c => c.Title == "Accounting" ).CourseID,
                    Grade = Grade.A
                    },
                    new Enrollment {
                    StudentID = students.Single(s => s.LastName == "Jefferson").ID,
                    CourseID = courses.Single(c => c.Title == "International Economics" ).CourseID,
                    Grade = Grade.C
                    },
                    new Enrollment {
                        StudentID = students.Single(s => s.LastName == "Adams").ID,
                    CourseID = courses.Single(c => c.Title == "Calculus" ).CourseID,
                    Grade = Grade.A
                    },
                    new Enrollment {
                        StudentID = students.Single(s => s.LastName == "Clifford").ID,
                    CourseID = courses.Single(c => c.Title == "Trigonometry" ).CourseID,
                    Grade = Grade.A
                    },
                    new Enrollment {
                    StudentID = students.Single(s => s.LastName == "Clifford").ID,
                    CourseID = courses.Single(c => c.Title == "Composition" ).CourseID,
                    Grade = Grade.B
                    },
                    new Enrollment {
                    StudentID = students.Single(s => s.LastName == "Jefferson").ID,
                    CourseID = courses.Single(c => c.Title == "Chemistry" ).CourseID,
                    Grade = Grade.A
                    },
                    new Enrollment {
                    StudentID = students.Single(s => s.LastName == "Filiment").ID,
                    CourseID = courses.Single(c => c.Title == "Accounting").CourseID,
                    Grade = Grade.C
                    },
                new Enrollment {
                    StudentID = students.Single(s => s.LastName == "Mulna").ID,
                    CourseID = courses.Single(c => c.Title == "Chemistry").CourseID,
                    Grade = Grade.B
                    },
                    new Enrollment {
                    StudentID = students.Single(s => s.LastName == "Adams").ID,
                    CourseID = courses.Single(c => c.Title == "Composition").CourseID,
                    Grade = Grade.B
                    },
                    new Enrollment {
                    StudentID = students.Single(s => s.LastName == "Adams").ID,
                    CourseID = courses.Single(c => c.Title == "Literature").CourseID,
                    Grade = Grade.A
                    }
            };

            foreach (Enrollment e in enrollments)
            {
                var enrollmentInDataBase = context.Enrollments.Where(
                    s =>
                            s.Student.ID == e.StudentID &&
                            s.Course.CourseID == e.CourseID).SingleOrDefault();
                if (enrollmentInDataBase == null)
                {
                    context.Enrollments.Add(e);
                }
            }
            context.SaveChanges();
        }
    }
}