import { render, screen } from '@testing-library/react';
import App from './App';

test('renders learn react link', () => {
  render(<App />);
  const linkElement = screen.getByText(/Aprende React Aqui pez dorado por el sol jaja/i);
  expect(linkElement).toBeInTheDocument();
});

