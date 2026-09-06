-- ============================================
-- PROYECTO: Sistema Biblioteca (PostgreSQL)
-- Autor: Gerlin David Perea Rivas
-- ============================================

-- 1. CREAR TABLAS
CREATE TABLE autor (
    autor_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50)
);

CREATE TABLE usuarios (
    usuario_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE,
    telefono VARCHAR(20)
);

CREATE TABLE libros (
    libro_id SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    anio_publicacion INTEGER,
    autor_id INTEGER REFERENCES autor(autor_id)
);

CREATE TABLE prestamos (
    prestamo_id SERIAL PRIMARY KEY,
    libro_id INTEGER REFERENCES libros(libro_id),
    usuario_id INTEGER REFERENCES usuarios(usuario_id),
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE
);

-- 2. INSERTAR DATOS DE EJEMPLO
INSERT INTO autor (nombre, nacionalidad) VALUES
('Paulo Coelho', 'Brasileño');

INSERT INTO usuarios (nombre, correo, telefono) VALUES
('Gerlin Perea', 'gpp10@gmail.com', 3141234567);

INSERT INTO libros (titulo, anio_publicacion, isbn, autor_id) VALUES
('Veronika decide morir', 1998, 9780060011932, 1);

INSERT INTO prestamos (libro_id, usuario_id, fecha_prestamo) VALUES
(1, 1, '2026-09-04');

-- 3. CONSULTA DE EJEMPLO
SELECT libros.titulo, autor.nombre AS autor, libros.anio_publicacion
FROM libros
JOIN autor ON libros.autor_id = autor.autor_id;