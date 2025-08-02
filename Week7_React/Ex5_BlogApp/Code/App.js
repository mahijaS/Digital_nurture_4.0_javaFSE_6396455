
import React from 'react';
import './App.css';
import BookDetails from './components/BookDetails';
import BlogDetails from './components/BlogDetails';
import CourseDetails from './components/CourseDetails';
import { books, blogs, courses } from './data';

function App() {
  const showBooks = true;
  const showBlogs = true;
  const showCourses = true;

  return (
    <div className="app">
      <div className="container">
        {showCourses && <CourseDetails courses={courses} />}

        <div className="separator" />

        {showBooks ? <BookDetails books={books} /> : <p>Books are hidden</p>}

        <div className="separator" />

        {showBlogs && <BlogDetails blogs={blogs} />}
      </div>
    </div>
  );
}

export default App;
