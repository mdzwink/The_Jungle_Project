
describe('visit home page', () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("can click on product and be directed to product page", () => {
    cy.get('.products').find('[alt="Scented Blade"]').click()
      .get('.quantity')
  });

})