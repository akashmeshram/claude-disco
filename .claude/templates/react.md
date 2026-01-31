# React Project Rules

## Code Style

### File Structure
```
src/
├── components/
│   ├── Button/
│   │   ├── Button.tsx
│   │   ├── Button.test.tsx
│   │   └── index.ts
│   └── ...
├── hooks/
├── pages/ or routes/
├── services/
├── stores/
├── types/
└── utils/
```

### Component Structure
```tsx
// Imports
import { useState, useEffect } from 'react';
import { useQuery } from '@tanstack/react-query';

// Types
interface Props {
  userId: string;
  onSelect?: (user: User) => void;
}

// Component
export function UserCard({ userId, onSelect }: Props) {
  // Hooks first
  const [isOpen, setIsOpen] = useState(false);
  const { data: user, isLoading } = useQuery(['user', userId], fetchUser);

  // Event handlers
  const handleClick = () => {
    onSelect?.(user);
  };

  // Early returns
  if (isLoading) return <Skeleton />;
  if (!user) return null;

  // Render
  return (
    <div onClick={handleClick}>
      {user.name}
    </div>
  );
}
```

### Naming
```tsx
// Components - PascalCase
function UserProfile() { }

// Hooks - use prefix
function useUser(id: string) { }

// Event handlers - handle prefix
const handleClick = () => { };
const handleSubmit = (e: FormEvent) => { };

// Boolean props - is/has/should prefix
interface Props {
  isLoading: boolean;
  hasError: boolean;
  shouldAnimate: boolean;
}
```

## Patterns

### State Management
```tsx
// Local state for UI
const [isOpen, setIsOpen] = useState(false);

// Server state with React Query
const { data, isLoading } = useQuery(['key'], fetchFn);

// Global state with Zustand/Jotai
const user = useStore((state) => state.user);
```

### Custom Hooks
```tsx
function useDebounce<T>(value: T, delay: number): T {
  const [debouncedValue, setDebouncedValue] = useState(value);

  useEffect(() => {
    const timer = setTimeout(() => setDebouncedValue(value), delay);
    return () => clearTimeout(timer);
  }, [value, delay]);

  return debouncedValue;
}
```

### Error Boundaries
```tsx
class ErrorBoundary extends Component<Props, State> {
  state = { hasError: false };

  static getDerivedStateFromError() {
    return { hasError: true };
  }

  componentDidCatch(error: Error, info: ErrorInfo) {
    logError(error, info);
  }

  render() {
    if (this.state.hasError) {
      return <ErrorFallback />;
    }
    return this.props.children;
  }
}
```

### Form Handling
```tsx
// With react-hook-form
const { register, handleSubmit, formState: { errors } } = useForm<FormData>();

const onSubmit = (data: FormData) => {
  mutation.mutate(data);
};

<form onSubmit={handleSubmit(onSubmit)}>
  <input {...register('email', { required: true })} />
  {errors.email && <span>Required</span>}
</form>
```

## Testing

### Component Tests
```tsx
import { render, screen, fireEvent } from '@testing-library/react';
import { UserCard } from './UserCard';

describe('UserCard', () => {
  it('renders user name', () => {
    render(<UserCard user={mockUser} />);
    expect(screen.getByText(mockUser.name)).toBeInTheDocument();
  });

  it('calls onSelect when clicked', () => {
    const onSelect = vi.fn();
    render(<UserCard user={mockUser} onSelect={onSelect} />);

    fireEvent.click(screen.getByRole('button'));
    expect(onSelect).toHaveBeenCalledWith(mockUser);
  });
});
```

### Hook Tests
```tsx
import { renderHook, act } from '@testing-library/react';
import { useCounter } from './useCounter';

test('increments counter', () => {
  const { result } = renderHook(() => useCounter());

  act(() => {
    result.current.increment();
  });

  expect(result.current.count).toBe(1);
});
```

## Performance

### Memoization
```tsx
// Memoize expensive calculations
const sortedItems = useMemo(
  () => items.sort((a, b) => a.name.localeCompare(b.name)),
  [items]
);

// Memoize callbacks
const handleClick = useCallback(() => {
  doSomething(id);
}, [id]);

// Memoize components
const MemoizedComponent = memo(ExpensiveComponent);
```

### Code Splitting
```tsx
// Lazy load routes/components
const Dashboard = lazy(() => import('./pages/Dashboard'));

<Suspense fallback={<Loading />}>
  <Dashboard />
</Suspense>
```

## Accessibility

- Use semantic HTML
- Add ARIA labels where needed
- Ensure keyboard navigation
- Test with screen readers
- Maintain focus management
