import styled from "styled-components"
import { PrimaryButton } from "../../theme"

export const MainSection = styled.section`
  display: flex;
  flex-direction: column;
  padding: 1rem;
  width: 100%;

  summary {
    margin: 10px 0;
    cursor: pointer;

    p {
      padding: 5px 0;
    }
  }
`

export const BackButton = styled(PrimaryButton)`
  margin: .5rem 0;
`