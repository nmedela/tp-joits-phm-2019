import React from "react";
import { shallow } from "enzyme";
import Login from "./Login";

// estan serian las default props de nuestro componente
const props = {};
const setup = (newProps = {}) => {
  //mergeamos las props iniciales con las que nos vienen por parametro
  const mergedProps = {
    ...props,
    ...newProps
  };
  // hacemos un render del componente con estas props mergeadas
  const wrapper = shallow(<Login {...mergedProps} />);

  // retornamos datos que vamos a usar para nuestros test, ejemplo : wrapper, loginContainer
  return {
    wrapper,
    loginContainer: wrapper.find(".login__container"),
    userInput: wrapper.find(".login__container__user-input"),
    passwordInput: wrapper.find(".login__container__password-input"),
    TextField: wrapper.find("TextField"),
    AcceptButton: wrapper.find(".login__container__accept-button"),
    CancelButton: wrapper.find(".login__container__cancel-button")
  };
};
it("renders without crashing", () => {
  shallow(<Login />);
});

describe("basic render", () => {
  const {
    wrapper,
    loginContainer,
    userInput,
    passwordInput,
    TextField,
    AcceptButton,
    CancelButton
  } = setup();
  it("render container", () => {
    expect(loginContainer).toExist();
  });
  it("render 2 textFields", () => {
    expect(TextField).toHaveLength(2);
  });

  describe("at the user input", () => {
    const userInputProps = userInput.props();
    it("render it", () => {
      expect(userInput).toExist();
    });
    it('pass the prop label with "Usuario"', () => {
      expect(userInputProps.label).toBe("Usuario");
    });
    it('the is type "text"', () => {
      expect(userInputProps.type).toBe("text");
    });
  });
  describe("at the password input", () => {
    const passwordInputProps = passwordInput.props();
    it("render it", () => {
      expect(passwordInput).toExist();
    });
    it('pass the prop label with "Contraseña"', () => {
      expect(passwordInputProps.label).toBe("Contraseña");
    });
    it('the is type "password"', () => {
      expect(passwordInputProps.type).toBe("password");
    });
  });

  it("render a AcceptButton", () => {
    console.log(wrapper.debug());
    expect(AcceptButton).toExist();
  });

  it("render 'Aceptar' inside this button", () => {
    expect(AcceptButton.render().text()).toBe("Aceptar");
  });
  it("the AcceptButton is primary", () => {
    expect(AcceptButton.props().color).toBe("primary");
  });
  it("render a cancel button", () => {
    expect(CancelButton).toExist();
  });
  it("render 'Cancelar' inside the cancel button", () => {
    expect(CancelButton.render().text()).toBe("Cancelar");
  });
  it("the cancel button is secondary", () => {
    expect(CancelButton.props().color).toBe("secondary");
  });
});
