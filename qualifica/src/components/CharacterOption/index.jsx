import styles from "./CharacterOption.module.css";
import { Link } from "react-router-dom";

export function CharacterOption({ title, url, creationDate, skinColor }) {
  return (
    <div className={styles.container}>
      <h1>Name: {title}</h1>
      <p>Data de criação: {creationDate}</p>
      <div className={styles.button}>
        <Link to={url}>Saiba mais</Link>
      </div>
    </div>
  );
}
