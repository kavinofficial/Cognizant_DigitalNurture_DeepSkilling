import { useState } from "react";
import BookDetails from "./components/BookDetails";
import BlogDetails from "./components/BlogDetails";
import CourseDetails from "./components/CourseDetails";

function App() {
  const [view, setView] = useState("book");
  const [renderMethod, setRenderMethod] = useState("switch");

  // 1️⃣ Element Variable
  let elementView;
  if (view === "book") {
    elementView = <BookDetails />;
  } else if (view === "blog") {
    elementView = <BlogDetails />;
  } else {
    elementView = <CourseDetails />;
  }

  return (
    <div style={{ padding: "20px" }}>
      <h1>Blogger App</h1>

      {/* Select Component */}
      <div style={{ marginBottom: "10px" }}>
        <button onClick={() => setView("book")}>Show Book</button>
        <button onClick={() => setView("blog")}>Show Blog</button>
        <button onClick={() => setView("course")}>Show Course</button>
      </div>

      {/* Select Rendering Method */}
      <div style={{ marginBottom: "10px" }}>
        <strong>Rendering Method:</strong><br />
        <button onClick={() => setRenderMethod("element")}>Element Variable</button>
        <button onClick={() => setRenderMethod("ternary")}>Ternary Operator</button>
        <button onClick={() => setRenderMethod("logical")}>Logical &&</button>
        <button onClick={() => setRenderMethod("iife")}>IIFE</button>
        <button onClick={() => setRenderMethod("switch")}>Switch</button>
      </div>

      <hr />

      {/* Render Based on Selected Method */}
      {renderMethod === "element" && (
        <>
          <h3>1. Using Element Variable</h3>
          {elementView}
        </>
      )}

      {renderMethod === "ternary" && (
        <>
          <h3>2. Using Ternary Operator</h3>
          {view === "book" ? (
            <BookDetails />
          ) : view === "blog" ? (
            <BlogDetails />
          ) : (
            <CourseDetails />
          )}
        </>
      )}

      {renderMethod === "logical" && (
        <>
          <h3>3. Using Logical && Operator</h3>
          {view === "book" && <BookDetails />}
          {view === "blog" && <BlogDetails />}
          {view === "course" && <CourseDetails />}
        </>
      )}

      {renderMethod === "iife" && (
        <>
          <h3>4. Using IIFE</h3>
          {
            (() => {
              if (view === "book") return <BookDetails />;
              if (view === "blog") return <BlogDetails />;
              if (view === "course") return <CourseDetails />;
            })()
          }
        </>
      )}

      {renderMethod === "switch" && (
        <>
          <h3>5. Using Switch Case</h3>
          {
            (() => {
              switch (view) {
                case "book":
                  return <BookDetails />;
                case "blog":
                  return <BlogDetails />;
                case "course":
                  return <CourseDetails />;
                default:
                  return <p>No view selected</p>;
              }
            })()
          }
        </>
      )}
    </div>
  );
}

export default App;
