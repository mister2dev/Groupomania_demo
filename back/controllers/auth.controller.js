// const db = require("../config/db");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
require("dotenv").config();
const fs = require("fs");
const path = require("path");

//--------Inscription d'un nouvel utilisateur--------//

// exports.signup = async (req, res) => {
//   try {
//     const { password, username, email, description } = req.body;
//     const encryptedPassword = await bcrypt.hash(password, 10);

//     // Définir l'image par défaut de l'utilisateur
//     const attachment =
//       "https://res.cloudinary.com/ddj78kfck/image/upload/v1740704749/avatar-no.png";

//     // Requête SQL pour l'insertion dans PostgreSQL
//     const sql = `
//       INSERT INTO users (username, email, password, description, attachment, is_active, is_admin, created_at, updated_at)
//       VALUES ($1, $2, $3, $4, $5, true, false, NOW(), NOW())
//       RETURNING id;
//     `;

//     const values = [
//       username,
//       email,
//       encryptedPassword,
//       description,
//       attachment,
//     ];

//     // Envoi vers la base de données avec test de doublon
//     await db.query(sql, values);

//     res.status(201).json({ message: "Nouvel utilisateur créé" });
//   } catch (err) {
//     console.error("Erreur lors de l'inscription :", err);
//     if (err.code === "23505") {
//       if (err.detail.includes("username")) {
//         res.status(409).json({ error: "Nom d'utilisateur déjà enregistré" });
//       } else if (err.detail.includes("email")) {
//         res.status(409).json({ error: "Email déjà enregistré" });
//       }
//     } else {
//       res.status(500).json({ message: "Échec de l'enregistrement", err });
//     }
//   }
// };

// exports.login = async (req, res) => {
//   const { email, password: clearPassword } = req.body;
//   const sql = `
//     SELECT id, username, password, is_active, description, attachment, is_admin, created_at
//     FROM users
//     WHERE email = $1;
//   `;

//   try {
//     const { rows } = await db.query(sql, [email]);
//     const user = rows[0];

//     if (!user) {
//       return res.status(401).json({ error: "Email non reconnu" });
//     }

//     // Vérification si le compte utilisateur est actif
//     if (!user.is_active) {
//       return res.status(401).json({
//         error:
//           "Votre compte n'est pas actif. Veuillez contacter l'administrateur.",
//       });
//     }

//     // Comparaison du mot de passe avec bcrypt
//     const match = await bcrypt.compare(clearPassword, user.password);
//     if (!match) {
//       return res.status(401).json({ error: "Mot de passe incorrect" });
//     }

//     // Création du token JWT
//     const maxAge = "24h";
//     const token = jwt.sign({ userId: user.id }, process.env.JWT_TOKEN, {
//       expiresIn: maxAge,
//     });

//     res.status(200).json({
//       userId: user.id,
//       user: user.username,
//       token,
//       description: user.description,
//       created_at: user.created_at,
//       imagePath: user.attachment,
//       admin: user.is_admin,
//     });
//   } catch (err) {
//     console.error("Erreur lors de la connexion :", err);
//     return res.status(500).json({ error: "Erreur serveur" });
//   }
// };

exports.login = async (req, res) => {
  const { email, password: clearPassword } = req.body;

  const users = JSON.parse(
    fs.readFileSync(path.join(__dirname, "../database/users.json"), "utf-8")
  );

  const user = users.find((u) => u.email === email);

  if (!user) {
    return res.status(401).json({ error: "Email non reconnu" });
  }

  if (!user.is_active) {
    return res.status(401).json({
      error:
        "Votre compte n'est pas actif. Veuillez contacter l'administrateur.",
    });
  }

  const match = await bcrypt.compare(clearPassword, user.password);
  if (!match) {
    return res.status(401).json({ error: "Mot de passe incorrect" });
  }

  const maxAge = "24h";
  const token = jwt.sign(
    { userId: user.id },
    process.env.JWT_TOKEN || "demo_token",
    {
      expiresIn: maxAge,
    }
  );

  res.status(200).json({
    userId: user.id,
    user: user.username,
    token,
    description: user.description,
    created_at: user.created_at,
    imagePath: user.attachment,
    admin: user.is_admin,
  });
};

//--------Désactivation d'un compte utilisateur--------//

exports.desactivateAccount = async (req, res) => {
  // const userId = req.params.id;
  // const sql = `UPDATE users SET is_active = false WHERE id = $1`;
  // try {
  //   await db.query(sql, [userId]);
  //   res.status(200).json("Votre compte a bien été désactivé");
  // } catch (err) {
  //   console.error("Erreur lors de la désactivation du compte :", err);
  //   res.status(500).json({ error: "Erreur serveur" });
  // }
};
