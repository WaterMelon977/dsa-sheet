# Glassmorphism Design System (Frosted Glass Look)

Drawing inspiration from the spatial UI design provided, here is the breakdown of the **Glassmorphism** effect. This style focuses on transparency, multi-layering, and background blur to create depth and focus.

## 1. Core Panel Properties
To achieve the "Our Nearby Neighbors" panel look:

- **Background Transparency**: Use a very low opacity white (or neutral) fill.
  - `background: rgba(255, 255, 255, 0.08);`
- **Frosted Blur (Backdrop-Filter)**: This is the most critical property. It blurs what is behind the element.
  - `backdrop-filter: blur(24px);`
  - `-webkit-backdrop-filter: blur(24px);` (for Safari compatibility)
- **Subtle Edge Definition**: A thin, light border defines the shape without feeling heavy.
  - `border: 1px solid rgba(255, 255, 255, 0.15);`
- **Corner Radii**: Large, smooth corners are essential for the "spatial" aesthetic.
  - `border-radius: 2rem;` (approx 32px)
- **Shadow/Depth**: A soft, wide shadow helps separate the glass from the environment.
  - `box-shadow: 0 12px 40px 0 rgba(0, 0, 0, 0.3);`

## 2. Interactive Components

### Buttons (e.g., "View Orbits")
- **Style**: Higher opacity than the panel background.
- **Active State**: Slightly lighter or a subtle glow.
- `background: rgba(255, 255, 255, 0.2);`
- `border-radius: 9999px;` (pill shape)

### Selection Tabs (e.g., "Satellite" selected)
The image shows a selection pill where the active item is visually lifted.
- **Container**: Minimal background, mostly relying on the panel's blur.
- **Selected Item**:
  - `background: rgba(255, 255, 255, 0.15);`
  - `box-shadow: inset 0 0 0 0.5px rgba(255, 255, 255, 0.2);` (Internal border for crispness)
  - `border-radius: 12px;`
- **Inactive Items**: No background, just white text at ~70% opacity.

## 3. Implementation (Tailwind CSS Recommendation)

We can translate this directly into our `globals.css` as a utility class:

```css
.glass-panel {
    background: rgba(255, 255, 255, 0.08);
    backdrop-filter: blur(24px);
    -webkit-backdrop-filter: blur(24px);
    border: 1px solid rgba(255, 255, 255, 0.15);
    border-radius: 2rem;
    box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.25);
}

.glass-pill-selected {
    background: rgba(255, 255, 255, 0.15);
    border: 0.5px solid rgba(255, 255, 255, 0.2);
    border-radius: 12px;
}
```

## 4. Visual Contrast Tips
- **Typography**: Always use `white` or `zinc-100` for primary text. Use `zinc-400` or `rgba(255, 255, 255, 0.6)` for secondary descriptions to maintain the airy feel.
- **Backgrounds**: This design shines best over colorful, contrasting, or photographic backgrounds (like the room scene in the image). Since our dashboard is dark `#0a0a0a`, we should combine this with **Background Glows** (radial gradients) to ensure the blur has something interesting to "capture" and diffuse.
