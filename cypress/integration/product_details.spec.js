
describe('visit home page', () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("There is products on the page", () => {
    cy.get('.products').find('[alt="Scented Blade"]').click()
      .contains("The Scented Blade is an extremely rare")
  });

})