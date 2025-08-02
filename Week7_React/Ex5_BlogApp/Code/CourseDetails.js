import React from 'react';

function CourseDetails({ courses }) {
  return (
    <div className="mystyle1">
      <h1>Course Details</h1>
      {courses && courses.length > 0 ? (
        courses.map((course, index) => (
          <div key={index}>
            <h3>{course.cname}</h3>
            <p>{course.date}</p>
          </div>
        ))
      ) : (
        <p>No course data available</p>
      )}
    </div>
  );
}

export default CourseDetails;
