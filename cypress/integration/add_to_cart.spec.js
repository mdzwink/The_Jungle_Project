
describe('visit home page', () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("can add item to cart and cart count is changed", () => {
    cy.get('.nav-link')
      .contains('My Cart (0)')
    cy.get('.products')
      .get('.btn')
      .first()
      .click({force: true})
    cy.get('.nav-link')
      .contains('My Cart (1)')

  });

})