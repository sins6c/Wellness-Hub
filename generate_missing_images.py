from PIL import Image, ImageDraw, ImageFont
import os

def create_placeholder_image(width, height, text, filename):
    # Create a new image with a purple background
    image = Image.new('RGB', (width, height), (46, 43, 77))
    draw = ImageDraw.Draw(image)
    
    # Calculate font size (30% of the smallest dimension)
    font_size = int(min(width, height) * 0.2)
    try:
        font = ImageFont.truetype("arial.ttf", font_size)
    except:
        font = ImageFont.load_default()

    # Calculate text position to center it
    text_bbox = draw.textbbox((0, 0), text, font=font)
    text_width = text_bbox[2] - text_bbox[0]
    text_height = text_bbox[3] - text_bbox[1]
    x = (width - text_width) // 2
    y = (height - text_height) // 2

    # Draw text in white
    draw.text((x, y), text, fill=(255, 255, 255), font=font)
    
    # Ensure the directory exists
    os.makedirs(os.path.dirname(filename), exist_ok=True)
    
    # Save the image
    image.save(filename, 'PNG')

def main():
    # Create missing images
    create_placeholder_image(1200, 400, "Special Deals\n& Offers", "assets/images/deals_banner.png")
    create_placeholder_image(800, 600, "Welcome to\nWellness Hub", "assets/images/onboarding1.png")
    create_placeholder_image(800, 600, "Track Your\nWellness", "assets/images/onboarding2.png")
    create_placeholder_image(800, 600, "Discover\nServices", "assets/images/onboarding3.png")

if __name__ == "__main__":
    main() 