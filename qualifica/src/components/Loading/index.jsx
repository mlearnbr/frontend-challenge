import styles from "./Loading.module.css";

import YodaImg from "../../assets/yodaImg.png";

export function Loading() {
  return (
    <div className={styles.container}>
      <div>
        <img src={YodaImg} alt="R2d2" />
        <h1>Carregando dados...</h1>
      </div>
    </div>
  );
}
