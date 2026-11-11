import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Rent Split Ledger",
  description: "Who paid what, and who owes whom",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className="antialiased">{children}</body>
    </html>
  );
}
