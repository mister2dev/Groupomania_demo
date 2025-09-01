import React, { useState, useEffect } from "react";
import Thread from "../components/Thread";
import NewPostForm from "../components/Post/NewPostForm";
import axios from "axios";
import Swal from "sweetalert2";

const Home = () => {
  const [posts, setPosts] = useState([]);

  useEffect(() => {
    Swal.fire({
      title: "Version Démo",
      text: "Bienvenue sur la version démo de Groupomania, vous ne pouvez pas modifier les données.",
      icon: "info",
      iconColor: "#DC645A",
      confirmButtonText: "Compris",
      confirmButtonColor: "#4e5166",
      background: "#ffd0c4", // Fond rose pêche
      backdrop: `
        rgba(0, 0, 0, 0.4)
      `,
    });
  }, []);

  // Récuperation de tous les posts
  const getPosts = (num) => {
    const token = localStorage.getItem("token");

    return axios
      .get(`${process.env.REACT_APP_API_URL}api/post/`, {
        headers: {
          // Ajout du token dans l'en-tête Authorization
          Authorization: `Bearer ${token}`,
        },
      })
      .then((res) => {
        // tableau des posts 0 à num
        console.log("res.data", res.data);
        const array = res.data.slice(0, num);
        // Enregistrement du array dans l'état
        setPosts(array);
      })
      .catch((err) => console.log(err));
  };

  return (
    <div className="home">
      <div className="main">
        <div className="home-header">
          {/* Envoi d'une props avec tous les posts dans l'élement NewPostForm afin de rafraichir la page après un nouveau post */}
          <NewPostForm getPosts={getPosts} />
        </div>
        {/* Envoi d'une props avec tous les posts dans l'élement Thread */}
        <Thread getPosts={getPosts} posts={posts} />
      </div>
    </div>
  );
};

export default Home;
