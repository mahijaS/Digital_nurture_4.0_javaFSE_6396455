
import React from 'react';

function BlogDetails({ blogs }) {
  return (
    <div className="v1">
      <h1>Blog Details</h1>
      {blogs.length > 0 &&
        blogs.map((blog, index) => (
          <div key={index}>
            <h2>{blog.title}</h2>
            <h4><b>{blog.author}</b></h4>
            <p>{blog.description}</p>
          </div>
        ))}
    </div>
  );
}

export default BlogDetails;
