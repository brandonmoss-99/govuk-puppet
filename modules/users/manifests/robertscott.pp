# Create the robertscott user
class users::robertscott {
  govuk_user { 'robertscott':
    ensure   => absent,
    fullname => 'Robert Scott',
    email    => 'robert.scott@digital.cabinet-office.gov.uk',
    ssh_key  => [
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCoKsuRDGMN7duVFTHO42x+jh0My0+ismGJaBhtIoQxHyzjct7mPpq9DHd2Z1OXCmoG2kV+YL3/T2on5a62vPr+pX85Rx8LlRAYHKlPU1Q7iwZKo1Jx69/YwQbcdrtssmvMPCTptJETAReNRHH7/LIYMR//q6mTbKaO6IiIMaf4n9KPrRE0B5U19FbKbSWkAz7pJZ/ZqmlDZADi02fVn/Ng20IBaZBpx/qCaXKHpjcv3yjLWhm6XJ4NzW/0g4Y0sFMlq8Phs9wiOszj5oQhaJWvQSaPUfyYzksnn6QwTYitYRdDP/cows1QGHLgcjinZzA1wwbw4/0SnA96gcWw8CLNZ0sSAk9BCxsYLqcKUPDxROzKuUq9S7r09D8bw1klZFJuou8e19wJOqSdwWsA+1bDIkQWtWWEdhrv7g5hGexJ2muzMwLj6PkoZR05mN1ZqenjOM1+UqZ/+ADtxgk6UWJVodSQ7KfCMq1/zhzzYWFhejtiOG4wnOiJ+Hf2IUOFAWyf/d4ahkucU5Rc8TmaYCbrLnkJ25JpymZ0uaw1Sk/KHrQ/Oq3+ILuKD2eSldQ0g4QuNk+cp5kdIBWXTL9WkhtRe4PecsB3DXxyEz48IBnFMLF1rxSBf7KeOMoKt5h18qr2DAYOISRqMm1qJM397T16g6kmSKF0Bfs/CNjEgXuymw== robert.scott@thinkpad',
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDRtexRbpTgq8d5oj/uSlz6OgpeTZOmkub66LHlzJgUxVuaDq9eNxedsu+pG/T82X0v7HkaZP9pE1rVMCc3kl7srM17FYP14JjcIYkC4z+Lm+qt9rsCe0shrzrX7BEq/A7h8DzOwa9mnyoQnqda4Zc5T5jvBrCy+HQt8dFoGfhu+n8iXE3ytOlO2+ttLU8+DqpVuBwDavkF4N4TnWHETkFtf0bbRMNcMHIoytEzGxQsnCqGrJMfYgzeCTwA4GONBa/e4FvKAYyGKBKD2PQWmWo2UK9lnvAc5s5mM2/jrUh8hyGh3TBVtP/cxFswwuFik/D7aqjxTYaJCM0MIBzf1NddkZF18xwc0botYKuXLRAd8I1BglvC8zQyrTbC9p05t8ehRH9UXYhfa2vDhWcH3IttOPVMeixeCBF4KGpbECeNcixnLIkcoAdyGqVdJo12dnsRF6aH3nqlMUN92OCttjHzKt29+8vk2R8cIEH223LQbt8GZPQo27cXiIwvXNzRGvTjm5V6wJmuWqoVjoNuH2MDBUyKHTG1Cf0N+xAGFlZWx3HFJjcvdKdfChChJ1yOSZ3uQID+raEruxHjA+GYpWKjkzQJJutztm9xVZChGy9dsds5dl1/VKoN0uDJ+kLvvZYFEuntUJ9YIMoNAZdD9DXJysSA2PjFq2PpwcXzTkx+qw== robert.scott@mac',
    ],
  }
}
