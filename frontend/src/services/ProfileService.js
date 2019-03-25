export default class ProfileService {
  static getUserData(user) {
    return Promise.resolve({
      age: 38,
      name: "Pepito Morgano",
      money: 1500,
      friends: [
        {
          name: "Gonzalo",
          lastname: "Canton"
        }
      ]
    });
  }

  static chargeMoney(amount) {
    return Promise.resolve();
  }
  static modifyUser(user) {
    return Promise.resolve();
  }
  static addFriend(friend) {
    return Promise.resolve();
  }
  static searchFriends(searchFriends) {
    return Promise.resolve([
      {
        name: "Gonzalo",
        lastname: "rodriguez"
      }
    ]);
  }
}
