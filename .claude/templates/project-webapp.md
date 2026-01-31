# Web Application Project Template

Blueprint for creating frontend web applications.

## Directory Structure

```
project-root/
├── src/
│   ├── components/
│   │   ├── ui/                # Reusable UI components
│   │   │   ├── Button/
│   │   │   ├── Input/
│   │   │   └── Modal/
│   │   └── layout/            # Layout components
│   │       ├── Header/
│   │       ├── Sidebar/
│   │       └── Footer/
│   ├── pages/                 # Page components
│   │   ├── Home/
│   │   ├── Dashboard/
│   │   └── Settings/
│   ├── hooks/                 # Custom hooks
│   │   ├── useAuth.ts
│   │   └── useLocalStorage.ts
│   ├── services/              # API services
│   │   ├── api.ts
│   │   └── auth.service.ts
│   ├── store/                 # State management
│   │   ├── index.ts
│   │   └── slices/
│   ├── types/                 # TypeScript types
│   │   └── index.ts
│   ├── utils/                 # Utility functions
│   │   └── format.ts
│   ├── styles/                # Global styles
│   │   └── globals.css
│   ├── App.tsx
│   ├── main.tsx               # Entry point
│   └── vite-env.d.ts
├── public/
│   └── favicon.ico
├── tests/
│   ├── components/
│   ├── hooks/
│   └── setup.ts
├── .gitignore
├── .eslintrc.js
├── .prettierrc
├── index.html
├── package.json
├── tsconfig.json
├── vite.config.ts
└── README.md
```

## Essential Files

### Entry Point (`src/main.tsx`)
```tsx
import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter } from 'react-router-dom';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import App from './App';
import './styles/globals.css';

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: 60 * 1000,
      retry: 1,
    },
  },
});

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <QueryClientProvider client={queryClient}>
      <BrowserRouter>
        <App />
      </BrowserRouter>
    </QueryClientProvider>
  </React.StrictMode>
);
```

### App Component (`src/App.tsx`)
```tsx
import { Routes, Route } from 'react-router-dom';
import { Layout } from './components/layout/Layout';
import { Home } from './pages/Home';
import { Dashboard } from './pages/Dashboard';
import { NotFound } from './pages/NotFound';

function App() {
  return (
    <Layout>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/dashboard" element={<Dashboard />} />
        <Route path="*" element={<NotFound />} />
      </Routes>
    </Layout>
  );
}

export default App;
```

### Component Example (`src/components/ui/Button/Button.tsx`)
```tsx
import { forwardRef, ButtonHTMLAttributes } from 'react';
import styles from './Button.module.css';

interface ButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: 'primary' | 'secondary' | 'danger';
  size?: 'sm' | 'md' | 'lg';
  loading?: boolean;
}

export const Button = forwardRef<HTMLButtonElement, ButtonProps>(
  ({ variant = 'primary', size = 'md', loading, children, disabled, ...props }, ref) => {
    return (
      <button
        ref={ref}
        className={`${styles.button} ${styles[variant]} ${styles[size]}`}
        disabled={disabled || loading}
        {...props}
      >
        {loading ? <span className={styles.spinner} /> : children}
      </button>
    );
  }
);

Button.displayName = 'Button';
```

### Custom Hook Example (`src/hooks/useAuth.ts`)
```tsx
import { useState, useCallback, useEffect } from 'react';
import { authService } from '../services/auth.service';
import type { User } from '../types';

export function useAuth() {
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    authService.getCurrentUser()
      .then(setUser)
      .finally(() => setLoading(false));
  }, []);

  const login = useCallback(async (email: string, password: string) => {
    const user = await authService.login(email, password);
    setUser(user);
    return user;
  }, []);

  const logout = useCallback(async () => {
    await authService.logout();
    setUser(null);
  }, []);

  return { user, loading, login, logout, isAuthenticated: !!user };
}
```

### API Service (`src/services/api.ts`)
```tsx
const BASE_URL = import.meta.env.VITE_API_URL || '/api';

class ApiClient {
  private async request<T>(
    endpoint: string,
    options: RequestInit = {}
  ): Promise<T> {
    const response = await fetch(`${BASE_URL}${endpoint}`, {
      ...options,
      headers: {
        'Content-Type': 'application/json',
        ...options.headers,
      },
    });

    if (!response.ok) {
      throw new Error(`API Error: ${response.status}`);
    }

    return response.json();
  }

  get<T>(endpoint: string) {
    return this.request<T>(endpoint);
  }

  post<T>(endpoint: string, data: unknown) {
    return this.request<T>(endpoint, {
      method: 'POST',
      body: JSON.stringify(data),
    });
  }

  put<T>(endpoint: string, data: unknown) {
    return this.request<T>(endpoint, {
      method: 'PUT',
      body: JSON.stringify(data),
    });
  }

  delete<T>(endpoint: string) {
    return this.request<T>(endpoint, { method: 'DELETE' });
  }
}

export const api = new ApiClient();
```

## Package.json
```json
{
  "name": "my-webapp",
  "private": true,
  "version": "1.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "tsc && vite build",
    "preview": "vite preview",
    "test": "vitest",
    "test:ui": "vitest --ui",
    "lint": "eslint src/",
    "format": "prettier --write src/"
  },
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-router-dom": "^6.20.0",
    "@tanstack/react-query": "^5.0.0"
  },
  "devDependencies": {
    "@types/react": "^18.2.0",
    "@types/react-dom": "^18.2.0",
    "@vitejs/plugin-react": "^4.2.0",
    "typescript": "^5.0.0",
    "vite": "^5.0.0",
    "vitest": "^1.0.0",
    "@testing-library/react": "^14.0.0",
    "eslint": "^8.0.0",
    "prettier": "^3.0.0"
  }
}
```

## Vite Config (`vite.config.ts`)
```typescript
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import { resolve } from 'path';

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': resolve(__dirname, 'src'),
    },
  },
  test: {
    globals: true,
    environment: 'jsdom',
    setupFiles: './tests/setup.ts',
  },
});
```

## Best Practices

### Component Design
- Keep components small and focused
- Use composition over inheritance
- Colocate styles with components
- Export from index.ts barrels

### State Management
- Use React Query for server state
- Use Context/Zustand for client state
- Avoid prop drilling
- Keep state close to where it's used

### Performance
- Lazy load routes and heavy components
- Memoize expensive computations
- Virtualize long lists
- Optimize images and assets

### Testing
- Test user interactions, not implementation
- Use Testing Library queries
- Mock API calls
- Test error states
